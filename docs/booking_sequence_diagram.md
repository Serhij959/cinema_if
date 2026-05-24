# Діаграма послідовності: бронювання квитка (CinemaIF)

Sequence diagram процесу покупки квитка — від головної сторінки до QR-квитка після checkout.

## Учасники

| Учасник | Опис |
|---------|------|
| **Користувач** | Відвідувач сайту |
| **Home** | `HomeController` — афіша |
| **Bookings#show** | Вибір місць у залі |
| **Bookings#checkout** | Оформлення замовлення |
| **БД** | SQLite / ActiveRecord |
| **TicketMailer** | Лист з посиланням на квиток |

## Діаграма послідовності

```mermaid
sequenceDiagram
    participant User as Користувач
    participant Home as Home
    participant Show as Bookings#show
    participant Checkout as Bookings#checkout
    participant DB as БД
    participant Mailer as TicketMailer

    User->>Home: GET /
    Home->>DB: Отримати фільми та сеанси
    DB-->>Home: Movies + Screenings
    Home-->>User: Показ афіші

    User->>Show: GET /booking/:movie/:time?screening_id=
    Show->>DB: Отримати screening, movie, hall
    DB-->>Show: Дані сеансу
    Show->>DB: Отримати booked seats status = paid
    DB-->>Show: Зайняті місця
    Show-->>User: Показ схеми залу

    User->>Checkout: POST /bookings/checkout
    Checkout->>Checkout: Перевірка авторизації
    Checkout->>DB: Перевірка доступності місць
    DB-->>Checkout: Місця доступні

    loop Для кожного вибраного місця
        Checkout->>DB: Booking.create!(status: paid, ticket_token)
    end

    Checkout->>Mailer: ticket_email(user, ticket_token)
    Mailer-->>User: Email з квитком

    Checkout-->>User: redirect /ticket/:token
```

## Пояснення статусів і квитка

- **`status = paid`** — активний куплений квиток; таке місце вважається зайнятим на схемі залу.
- **`status = cancelled`** — скасований квиток; місце знову доступне для бронювання (у «Мої квитки» та при `Bookings#cancel_ticket`).
- **`ticket_token`** — один UUID на замовлення; об’єднує кілька `Booking` (місць) в одне замовлення / один QR-квиток.
- **Email** надсилається після успішного checkout через `TicketMailer#ticket_email`.
- **QR-квиток** відкривається за маршрутом `GET /ticket/:token` (дані з БД по `ticket_token`).

## Пов’язана документація

- [booking_flow.md](booking_flow.md) — повний потік з «Мої квитки» та скасуванням.

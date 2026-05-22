# Потік бронювання квитка (CinemaIF)

Цей документ описує, як користувач проходить шлях від афіші на головній сторінці до покупки квитка, QR-квитка, перегляду «Мої квитки» та скасування замовлення.

## Огляд

1. Користувач заходить на головну сторінку.
2. `HomeController` показує фільми та сеанси з БД.
3. Користувач вибирає сеанс.
4. Відкривається `BookingsController#show`.
5. Система показує зал і місця.
6. Зайняті місця беруться тільки з `Booking` зі `status: "paid"`.
7. Користувач вибирає місця.
8. Натискає checkout.
9. `BookingsController#checkout` перевіряє авторизацію.
10. Система перевіряє, чи місця ще не зайняті.
11. Для кожного вибраного місця створюється `Booking`.
12. Усі `Booking` одного замовлення мають один `ticket_token`.
13. Після покупки надсилається email через `TicketMailer`.
14. Користувача перекидає на QR-квиток.
15. У «Мої квитки» користувач бачить свої квитки.
16. Користувач може скасувати квиток.
17. При скасуванні `status` змінюється на `"cancelled"`.
18. Скасовані місця знову стають доступними.

## Діаграма послідовності

```mermaid
sequenceDiagram
    participant User as Користувач
    participant Home as HomeController
    participant BookingShow as Bookings#show
    participant Checkout as Bookings#checkout
    participant DB as БД
    participant Mailer as TicketMailer
    participant Ticket as QR Ticket
    participant MyTickets as Мої квитки

    User->>Home: GET /
    Home->>DB: Отримати фільми та сеанси
    DB-->>Home: Movies + Screenings
    Home-->>User: Афіша

    User->>BookingShow: GET /booking/:movie/:time?screening_id=
    BookingShow->>DB: Отримати screening, hall, movie
    BookingShow->>DB: Отримати booked seats зі status = paid
    DB-->>BookingShow: Дані сеансу + зайняті місця
    BookingShow-->>User: Схема залу

    User->>Checkout: POST /bookings/checkout
    Checkout->>Checkout: Перевірка авторизації
    Checkout->>DB: Перевірка чи місця вільні
    DB-->>Checkout: Результат перевірки

    loop Для кожного місця
        Checkout->>DB: Booking.create!(status: paid, ticket_token)
    end

    Checkout->>Mailer: ticket_email(user, ticket_token)
    Mailer-->>User: Email з посиланням на QR-квиток
    Checkout-->>Ticket: redirect /ticket/:token

    Ticket->>DB: Отримати bookings по ticket_token
    DB-->>Ticket: Дані квитка
    Ticket-->>User: QR-квиток

    User->>MyTickets: GET /my_tickets
    MyTickets->>DB: Отримати bookings current_user
    DB-->>MyTickets: Список квитків
    MyTickets-->>User: Мої квитки

    User->>MyTickets: DELETE /tickets/:token/cancel
    MyTickets->>DB: update bookings status = cancelled
    DB-->>MyTickets: Квиток скасовано
    MyTickets-->>User: Статус "Скасовано"
```

## Ключові маршрути

| Крок | HTTP | Шлях | Контролер / дія |
|------|------|------|-----------------|
| Афіша | GET | `/` (з locale) | `home#index` |
| Вибір місць | GET | `/booking/:movie/:time?screening_id=` | `bookings#show` |
| Оплата / checkout | POST | `/bookings/checkout` | `bookings#checkout` |
| QR-квиток | GET | `/ticket/:token` | `bookings#ticket` |
| Мої квитки | GET | `/my_tickets` | `bookings#my_tickets` |
| Скасування | DELETE | `/tickets/:token/cancel` | `bookings#cancel_ticket` |

## Важливі правила

1. **Зайняті місця** визначаються тільки по `status = "paid"`.
2. **Скасовані квитки** мають `status = "cancelled"`.
3. **Один `ticket_token`** об’єднує кілька місць в одне замовлення.
4. **Email** надсилається після успішного checkout.
5. **QR-квиток** відкривається через `ticket_token`.
6. **Користувач** бачить тільки свої квитки (у «Мої квитки» та при скасуванні — лише власні `Booking` з відповідним `ticket_token`).
7. **Адмін і модератор** керують фільмами, сеансами, анонсами та акціями через admin panel (`super_admin` додатково керує користувачами та ролями).

## Модель даних (спрощено)

```
User ──has_many──> Booking ──belongs_to──> Screening ──belongs_to──> Movie, Hall
```

- Окремої моделі `Ticket` немає: квиток = усі `Booking` з однаковим `ticket_token`.
- На одне місце — один рядок `Booking` (`row_number`, `seat_number`, `price`, `status`).

## Пов’язані файли в коді

| Компонент | Шлях |
|-----------|------|
| Афіша | `app/controllers/home_controller.rb` |
| Бронювання | `app/controllers/bookings_controller.rb` |
| Модель | `app/models/booking.rb` |
| Вибір місць | `app/views/bookings/show.html.erb` |
| QR-квиток | `app/views/bookings/ticket.html.erb` |
| Мої квитки | `app/views/bookings/my_tickets.html.erb` |
| Email | `app/mailers/ticket_mailer.rb` |
| Маршрути | `config/routes.rb` |

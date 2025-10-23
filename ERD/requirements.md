# Entity-Relationship Diagram (ERD)

## Entities and Attributes
- **User:** user_id, first_name, last_name, email, password_hash, phone_number, role, created_at  
- **Property:** property_id, host_id, name, description, location, pricepernight, created_at, updated_at  
- **Booking:** booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at  
- **Payment:** payment_id, booking_id, amount, payment_date, payment_method  
- **Review:** review_id, property_id, user_id, rating, comment, created_at  
- **Message:** message_id, sender_id, recipient_id, message_body, sent_at  

## Relationships
- User (1) ──< Property (M)
- User (1) ──< Booking (M)
- Property (1) ──< Booking (M)
- Booking (1) ──(1)── Payment (1)
- User (1) ──< Review (M)
- Property (1) ──< Review (M)
- User (1) ──< Message (M)

## Diagram
<img width="581" height="607" alt="Airbnb alx work drawio" src="https://github.com/user-attachments/assets/c5c525c9-47a3-4cd5-9a91-f28863f562c3" />

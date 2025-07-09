## Scale Up
In the future, maybe this app will be more instesting to many people and then they want more features like:

    Counting the number of clicks of each link.
    Allowing users to create custom aliases shortcode.
    Generating QR codes for URLs.
    ...
To ensure the system can grow and scale easily, I believe designing the code using SOLID principles will make it more readable, maintainable, and capable of adding more complex features in the future without complications.

---
## Collision Handling
To prevent collisions in the URL shortening process, I've implemented the following solution:

Each shortened URL is unique. I make sure that no two different URLs can have the same shortened URL code.

If the original URL already exists in the database, instead of generating a new shortened URL, the system will return the existing record. This prevents unnecessary duplication and ensures that the same URL always gets the same shortened code.

---

## Security

Rails provides strong protection against SQL injection by using ActiveRecord, so there's no need for raw SQL queries.

To prevent bruteforce attacks, maybe we can implement services like Cloudflare or use CAPTCHA to mitigate such threats.

Additionally, it's important to validate the original URL to make sure it's not a malicious link.
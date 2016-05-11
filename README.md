# Instatask

- Ruby version: 2.3.1+

- Rails version: 4.2+

- System dependencies
  - MySQL/MariaDB
  - Redis

- Database creation
  - rake db:create

- Database initialization
  - rake db:migrate

- Services (job queues, cache servers, search engines, etc.)
  - bundle exec sidekiq

---

## Supported Requested (All in JSON)

### POST /bugs

```
{ "bug": { "application_token": "a6d7c8d9e0a7", "priority": 0, "state_attributes": { "device": "IPhone 6", "os": "IOS", "memory": 1024, "storage": "4096" } } }
```

### Response:

`{ "number": 1 }`
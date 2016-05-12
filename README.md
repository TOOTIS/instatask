# Instatask

- Ruby version: 2.1+

- Rails version: 4.2+

- System dependencies
  - MySQL/MariaDB
  - Redis

- Database creation
  - rake db:create
  - rake db:migrate

- Services (job queues, cache servers, search engines, etc.)
  - bundle exec sidekiq

---

## Supported Requested (All in JSON)

### POST `/bugs`

```
{
  "bug": {
    "application_token": "202cb962ac59075b964b07152d234b70",
    "number": 2,
    "status": "fresh",
    "priority": "minor",
    "state": {
      "device": "IPhone 6",
      "os": "IOS",
      "memory": 1024,
      "storage": 4096
    }
  }
}
```

### Response (If good request):

```
{
  "number": 1
}
```

### Response (If bad request):

```
{
  "error": "400: Bad request"
}
```

---

### GET `/bugs/:application_token/:number`

### Response (If found):

```
{
  "bug": {
    "application_token": "202cb962ac59075b964b07152d234b70",
    "number": 2,
    "status": "fresh",
    "priority": "minor",
    "state": {
      "device": "IPhone 6",
      "os": "IOS",
      "memory": 1024,
      "storage": 4096
    }
  }
}
```

### Response (If not found):

```
{
  "error": "404: Not Found"
}
```

---

### GET `/bugs/count/:application_token`

### Response (If found):

```
{
  "count": 1
}
```

### Response (If not found):

```
{
  "error": "404: Not Found"
}
```
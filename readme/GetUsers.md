# Get all Users

**URL** : `/api/users`

**Method** : `GET`

## Success Response

**Code** : `200 OK`

**Content examples**

For an Application with correct token should recieve response like follows

```json
[
    {
        "id": 1,
        "user_id": 1547824270,
        "username": "Omar Shindy",
        "chat_id": 1547824270,
        "created_at": "2022-08-20T15:38:12.982Z",
        "updated_at": "2022-08-20T15:38:12.982Z"
    },
    {
        "id": 2,
        "user_id": 277191592,
        "username": "Youssef Shindy",
        "chat_id": 277191592,
        "created_at": "2022-08-20T15:38:22.446Z",
        "updated_at": "2022-08-20T15:38:22.446Z"
    }
]
```
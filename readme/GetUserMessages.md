# Get User Messages

**URL** : `/api/:chat_id/messages`

**Method** : `GET`

## Success Response

**Code** : `200 OK`

**Content examples**

For an Application with correct token should recieve response like follows

```json
[
    {
        "id": 1,
        "chat_id": 1547824270,
        "text": "Hello There",
        "created_at": "2022-08-20T15:40:41.250Z",
        "updated_at": "2022-08-20T15:40:41.250Z",
        "users_id": 1,
        "admin": null,
        "media_link": null
    },
    {
        "id": 2,
        "chat_id": 1547824270,
        "created_at": "2022-08-20T15:40:44.688Z",
        "updated_at": "2022-08-20T15:40:44.688Z",
        "users_id": 1,
        "admin": null,
        "media_link":
        "https://api.telegram.org/file/bot344550318:AAHXKB9qQw_k383xxZ9vtcJ_Z0vwJPZTlLQ/photos/photos/file_1.jpg"
    },
    {
        "id": 3,
        "chat_id": 1547824270,
        "text": "Please share with me more details",
        "created_at": "2022-08-20T15:44:46.072Z",
        "updated_at": "2022-08-20T15:44:46.072Z",
        "users_id": 1,
        "admin": false,
        "media_link": null
    }
]
```

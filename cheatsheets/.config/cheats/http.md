# HTTP

## Status Codes

### 1XX

| Status Code | Message | Description |
| :--- | :--- | :--- |
| **100** | Continue | The initial part of the request has been received, and the client should proceed. |
| **101** | Switching Protocols | The server is agreeing to change protocols as requested by the client. |

### 2XX

| Status Code | Message | Description |
| :--- | :--- | :--- |
| **200** | OK | The request succeeded. |
| **201** | Created | The request succeeded and a new resource was created. |
| **202** | Accepted | The request has been received but not yet acted upon or completed. |
| **204** | No Content | The request succeeded but there is no content to return. |
| **206** | Partial Content | The server is delivering only part of the resource due to a range header. |

### 3XX

| Status Code | Message | Description |
| :--- | :--- | :--- |
| **301** | Moved Permanently | The resource has permanently moved to a new URL. |
| **302** | Found | The resource has temporarily moved to a different URL. |
| **304** | Not Modified | The resource has not changed since the last request. |
| **307** | Temporary Redirect | The resource temporarily resides under a different URL, but the request method must not change. |
| **308** | Permanent Redirect | The resource has definitively moved, and the request method must remain the same. |

### 4XX

| Status Code | Message | Description |
| :--- | :--- | :--- |
| **400** | Bad Request | The server cannot process the request due to a client error or bad syntax. |
| **401** | Unauthorized | Authentication is required and has failed or has not yet been provided. |
| **403** | Forbidden | The client does not have permission to access the requested resource. |
| **404** | Not Found | The server cannot find the requested resource. |
| **405** | Method Not Allowed | The requested HTTP method is not supported for this resource. |
| **408** | Request Timeout | The server timed out waiting for the complete request from the client. |
| **409** | Conflict | The request could not be completed due to a conflict with the current state of the resource. |
| **410** | Gone | The requested resource is permanently no longer available and has no forwarding address. |
| **413** | Payload Too Large | The request is larger than the server is willing or able to process. |
| **415** | Unsupported Media Type | The server refuses to accept the request because the payload format is in an unsupported format. |
| **422** | Unprocessable Entity | The server understands the content type but was unable to process the contained instructions. |
| **429** | Too Many Requests | The client has sent too many requests in a given amount of time. |

### 5XX

| Status Code | Message | Description |
| :--- | :--- | :--- |
| **500** | Internal Server Error | The server encountered an unexpected condition. |
| **501** | Not Implemented | The server does not support the functionality required to fulfill the request. |
| **502** | Bad Gateway | The server received an invalid response from an upstream server. |
| **503** | Service Unavailable | The server is temporarily unable to handle the request. |
| **504** | Gateway Timeout | The server did not receive a timely response from an upstream server. |


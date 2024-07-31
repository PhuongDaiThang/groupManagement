# Quản lý Group và Người dùng

Hệ thống này bao gồm nhiều group và cho phép người dùng quản lý các group và bài viết blog một cách linh hoạt. Dưới đây là các tính năng cơ bản và chi tiết về quản lý group và người dùng.

## Quản lý Group

Hệ thống hỗ trợ nhiều group, mỗi người dùng đều có quyền tạo group.

### Group

- **Admin-group**: Người lập group sẽ tự động trở thành admin của group đó.
  - **Quyền của admin-group**:
    - Mời người dùng vào group.
    - Duyệt người dùng gia nhập group.
    - Xóa người dùng khỏi group.
    - Tạo và quản lý các danh mục blog trong group.
    - Tìm kiếm và lọc blog theo các tiêu chí (ví dụ: theo danh mục, người viết, thời gian đăng).

- **Người dùng trong group** (bao gồm cả admin-group):
  - Đăng các bài blog.
  - Sửa các bài blog của mình.
  - Xóa các bài blog của mình.
  - Xem các blog của mọi người trong group.

- **Phân quyền nâng cao**:
  - Tạo các role khác nhau trong group (ví dụ: moderator, member).
  - Gán các quyền khác nhau cho từng role (ví dụ: moderator có quyền duyệt bài viết, xóa bài viết của người khác).

- **User ngoài group**:
  - Chỉ được gửi yêu cầu join group.

## Quản lý Người dùng

- **Tự quản lý thông tin cá nhân**:
  - Không xem thông tin của người khác.
  - Có thể đăng các blog cá nhân.
  - Người dùng có thể chọn cho phép người khác xem blog của mình hoặc không.
  - Cho phép người dùng thay đổi thông tin cá nhân (như avatar, bio).
  - Cho phép người dùng thiết lập quyền riêng tư cho từng blog cá nhân (ví dụ: chỉ bạn bè xem được, công khai, chỉ mình tôi).

- **Tạo tài khoản**:
  - Sử dụng user/password.
  - Username không được trùng nhau.

- **Cải thiện bảo mật**:
  - Xác thực hai bước (2FA) khi đăng nhập.
  - Gửi thông báo qua email khi có hoạt động bất thường trên tài khoản.

- **Tương tác xã hội**:
  - Cho phép người dùng bình luận và like các blog của người khác.
  - Tạo hệ thống thông báo khi có bình luận mới hoặc khi bài viết được like.

## Các Trường Dữ Liệu

- **`created_at`**: Theo dõi thời điểm bản ghi được tạo.
- **`updated_at`**: Theo dõi thời điểm bản ghi được cập nhật lần cuối.
- **`created_by`**: Xác định người dùng đã tạo bản ghi.
- **`is_active`**: Xác định trạng thái hoạt động của bản ghi (ví dụ: tài khoản người dùng hoặc group).

### Ví dụ về các bảng dữ liệu

- **Users**:
  - `user_id` (PK): ID người dùng.
  - `username`: Tên người dùng.
  - `password`: Mật khẩu.
  - `email`: Email.
  - `is_active`: Trạng thái hoạt động.
  - `created_at`: Thời điểm tạo tài khoản.
  - `updated_at`: Thời điểm cập nhật tài khoản.

- **Groups**:
  - `group_id` (PK): ID group.
  - `group_name`: Tên group.
  - `created_by` (FK): Người dùng đã tạo group.
  - `created_at`: Thời điểm tạo group.

- **Blogs**:
  - `blog_id` (PK): ID bài viết.
  - `title`: Tiêu đề bài viết.
  - `content`: Nội dung bài viết.
  - `author_id` (FK): ID người viết.
  - `group_id` (FK): ID group chứa bài viết.
  - `is_public`: Trạng thái công khai.
  - `created_at`: Thời điểm tạo bài viết.
  - `updated_at`: Thời điểm cập nhật bài viết.

- **UserGroups**:
  - `user_group_id` (PK): ID duy nhất của mối quan hệ người dùng-group.
  - `user_id` (FK): ID của người dùng.
  - `group_id` (FK): ID của group.
  - `role` : Vai trò của người dùng trong group (ví dụ: admin, moderator, member).

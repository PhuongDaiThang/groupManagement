### Mô tả Hệ thống Quản lý Group 

Hệ thống này bao gồm nhiều group và cho phép người dùng quản lý các group và bài viết blog một cách linh hoạt. Dưới đây là mô tả chi tiết về hệ thống thống qua thiết kế :

#### 1. Bảng `Users`
Bảng `Users` chứa thông tin về người dùng trong hệ thống.
- **user_id (PK)**: ID người dùng, khóa chính.
- **username**: Tên người dùng, duy nhất và không được trùng lặp.
- **password**: Mật khẩu người dùng.
- **email**: Email của người dùng, duy nhất và không được trùng lặp.
- **is_active**: Trạng thái hoạt động của tài khoản (TRUE: hoạt động, FALSE: không hoạt động).
- **created_at**: Thời điểm tạo tài khoản.
- **updated_at**: Thời điểm cập nhật tài khoản lần cuối.

#### 2. Bảng `Groups`
Bảng `Groups` chứa thông tin về các group trong hệ thống.
- **group_id (PK)**: ID của group, khóa chính.
- **group_name**: Tên của group.
- **created_by (FK)**: ID của người dùng đã tạo group (liên kết với `user_id` trong bảng `Users`).
- **created_at**: Thời điểm tạo group.

#### 3. Bảng `Blogs`
Bảng `Blogs` chứa thông tin về các bài viết blog trong hệ thống.
- **blog_id (PK)**: ID của bài viết, khóa chính.
- **title**: Tiêu đề của bài viết.
- **content**: Nội dung của bài viết.
- **author_id (FK)**: ID của người viết bài (liên kết với `user_id` trong bảng `Users`).
- **group_id (FK)**: ID của group chứa bài viết (liên kết với `group_id` trong bảng `Groups`).
- **is_public**: Trạng thái công khai của bài viết (TRUE: công khai, FALSE: riêng tư).
- **created_at**: Thời điểm tạo bài viết.
- **updated_at**: Thời điểm cập nhật bài viết lần cuối.

#### 4. Bảng `UserGroups`
Bảng `UserGroups` chứa thông tin về mối quan hệ giữa người dùng và các group.
- **user_group_id (PK)**: ID duy nhất của mối quan hệ người dùng-group, khóa chính.
- **user_id (FK)**: ID của người dùng (liên kết với `user_id` trong bảng `Users`).
- **group_id (FK)**: ID của group (liên kết với `group_id` trong bảng `Groups`).
- **role**: Vai trò của người dùng trong group (ví dụ: admin, moderator, member).

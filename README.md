# Dự Án Quản Lý Nhóm và Blog

## Tổng Quan

Dự án quản lý nhóm và blog cung cấp một nền tảng để quản lý người dùng, nhóm, bài viết nhóm và cá nhân, cùng với các thông báo và tệp đính kèm. Hệ thống cho phép người dùng tạo và tham gia các nhóm, viết và quản lý các bài viết, mời người khác tham gia nhóm và nhận thông báo.


## Các Bảng Chính
### 1. Bảng `users`
- **Mô tả**: Lưu trữ thông tin cá nhân của người dùng như tên đăng nhập, mật khẩu, email, và thông tin cá nhân khác.
- **Chức năng**: Quản lý danh sách người dùng trong hệ thống.

### 2. Bảng `groups`
- **Mô tả**: Lưu trữ thông tin về các nhóm như tên nhóm, mô tả nhóm, và người tạo nhóm.
- **Chức năng**: Quản lý các nhóm mà người dùng có thể tham gia.

### 3. Bảng `group_members`
- **Mô tả**: Quản lý thông tin thành viên của các nhóm, bao gồm vai trò của họ trong nhóm.
- **Chức năng**: Theo dõi các thành viên và quyền hạn của họ trong các nhóm.

### 4. Bảng `group_invitations`
- **Mô tả**: Lưu trữ thông tin về các lời mời tham gia nhóm, bao gồm trạng thái và thời gian phản hồi.
- **Chức năng**: Quản lý các lời mời đến các người dùng khác để tham gia vào nhóm.

### 5. Bảng `group_blogs`
- **Mô tả**: Lưu trữ các bài viết được đăng trong các nhóm.
- **Chức năng**: Quản lý nội dung do các thành viên của nhóm tạo ra.

### 6. Bảng `personal_blogs`
- **Mô tả**: Lưu trữ các bài viết cá nhân của người dùng.
- **Chức năng**: Cho phép người dùng đăng bài viết cá nhân, với tùy chọn công khai hoặc riêng tư.

### 7. Bảng `notifications`
- **Mô tả**: Quản lý các thông báo gửi đến người dùng.
- **Chức năng**: Cung cấp hệ thống thông báo cho người dùng về các sự kiện quan trọng.

### 8. Bảng `roles`
- **Mô tả**: Lưu trữ các vai trò của người dùng trong hệ thống.
- **Chức năng**: Định nghĩa và quản lý các vai trò mà người dùng có thể nắm giữ.

### 9. Bảng `group_roles`
- **Mô tả**: Lưu trữ vai trò của người dùng trong các nhóm cụ thể.
- **Chức năng**: Quản lý quyền hạn của người dùng trong từng nhóm.

### 10. Bảng `comments`
- **Mô tả**: Lưu trữ các bình luận của người dùng trên các bài viết.
- **Chức năng**: Quản lý tương tác của người dùng thông qua các bình luận.

### 11. Bảng `files`
- **Mô tả**: Lưu trữ các tệp tin liên quan đến bài viết.
- **Chức năng**: Quản lý các tệp đính kèm trong các bài viết, bao gồm tệp tin và thời gian tải lên.


## Quy Trình Hoạt Động

1. **Người dùng đăng ký và đăng nhập** vào hệ thống.
2. **Người dùng tạo và quản lý nhóm**, tham gia nhóm, và mời người khác tham gia.
3. **Người dùng viết và quản lý các bài viết** trong nhóm hoặc cá nhân.
4. **Người dùng bình luận và tải lên tệp** đính kèm cho các bài viết.
5. **Người dùng nhận thông báo** về các sự kiện quan trọng liên quan đến họ.
6. **Quản lý vai trò** trong các nhóm để xác định quyền hạn của người dùng.

-.
[dbdiagram](https://dbdiagram.io/d/66b496e68b4bb5230e931c71)

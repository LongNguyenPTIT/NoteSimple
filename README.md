# Project *Note Simple*



## User Stories

The following **required** functionality is completed:

- [x] Xem danh sách note
- [x] Xem detail của note
- [x] Tạo / Sửa / Xoá Note
- [ ] Lưu note lên server (Firebase)
- [x] Xem và thêm note khi offline 
- [ ] Xem và thêm note khi online.
- Khi offline sẽ dùng core data để lưu xuống database local.
- Trong database local sẽ có flag isOffline để check đã đồng bộ hay chưa, flag isDeleted để check data đã bị xoá chưa 
- Khi user thêm note lúc offline thì flag isOffline = true. Khi online thì đồng bộ những note có flag isOffline = true lên server, sau đó gán lại flag isOffline = false sau khi đã đồng bộ thành công với server
- Khi user xoá 1 note lúc offline thì database local sẽ ko xoá liền, chỉ update flag isDeleted = true. Khi online thì đồng bộ những note có flag isDeleted = true lên server, sau đó xoá hết các data có flag isDeleted = true trong database local.

- [ ] App tự xử lí đồng bộ “những note khi thêm vào lúc offline” lên server.
- Trong database local sẽ có flag isOffline để check đã đồng bộ hay chưa, flag isDeleted để check data đã bị xoá chưa 
- Khi user them note lúc offline thì flag isOffline = true. Khi online thì đồng bộ những note có flag isOffline = true lên server, sau đó gán lại flag isOffline = false sau khi đã đồng bộ thành công với server


## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/LongNguyenPTIT/NoteSimple/blob/master/Demo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

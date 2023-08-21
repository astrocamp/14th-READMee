// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


const switchRoleButton = document.querySelector('#switchRole');

switchRoleButton.addEventListener("click", async function(event){
    console.log('click');
  // 發送 AJAX 請求以切換角色
  try {
    const response = await fetch('/path_to_switch_role', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({
        // 您可能需要傳遞一些參數，例如使用者 ID
      })
    });

    if (response.ok) {
      // 更新成功，可能需要重新載入頁面或更新用戶介面
      location.reload(); // 這只是示範，您可以根據需要進行更多處理
    } else {
      // 處理錯誤情況
      console.error('切換角色時發生錯誤');
    }
  } catch (error) {
    console.error('AJAX 請求失敗', error);
  }
});

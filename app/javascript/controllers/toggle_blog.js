// app/javascript/controllers/toggle_blog.js
let isVisible; // ここでは宣言しない
document.addEventListener("turbo:load", function() {
    if (typeof isVisible === 'undefined') {
        isVisible = true; // 初期化
    }
    
    const button = document.getElementById("toggle-button");
    const blogList = document.getElementById("blog-list");

    if (button) { // ボタンが存在するか確認
        button.addEventListener("click", function() {
            if (isVisible) {
                blogList.style.display = "none";
                button.textContent = " ∨ タスクを表示"; // ボタンのテキストを更新
            } else {
                blogList.style.display = "block";
                button.textContent = " ∧"; // ボタンのテキストを更新
            }
            isVisible = !isVisible; // 状態を反転
        });
    }
});tt
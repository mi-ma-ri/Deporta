document.addEventListener("DOMContentLoaded", function () {
  // タブに対してクリックイベントを適用
  const tabs = document.getElementsByClassName("js-tab");
  for (let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener("click", tabSwitch);
  }

  // タブをクリックすると実行する関数
  function tabSwitch() {
    // 引数で指定したセレクターと一致する直近の祖先要素を取得
    const ancestorEle = this.closest(".js-tab-panel");

    const active_tab_classes = "active_tab";
    const inactive_tab_classes = "inactive_tab";
    // タブのclassの値を変更
    if (ancestorEle.getElementsByClassName(active_tab_classes)[0]) {
      ancestorEle
        .getElementsByClassName(active_tab_classes)[0]
        .classList.add(inactive_tab_classes);
      ancestorEle
        .getElementsByClassName(active_tab_classes)[0]
        .classList.remove(active_tab_classes);
      this.classList.add(active_tab_classes);
      this.classList.remove(inactive_tab_classes);
    }

    // コンテンツのclassの値を変更
    const active_content_classes = "active_content";
    const inactive_content_classes = "inactive_content";
    const targetEle = ancestorEle.getElementsByClassName(
      "js-panel " + active_content_classes
    )[0];
    targetEle.classList.remove(active_content_classes);
    targetEle.classList.add(inactive_content_classes);

    const groupTabs = ancestorEle.getElementsByClassName("js-tab");
    const arrayTabs = Array.prototype.slice.call(groupTabs);
    const index = arrayTabs.indexOf(this);
    const targetPanel = ancestorEle.getElementsByClassName("js-panel")[index];
    targetPanel.classList.add(active_content_classes);
    targetPanel.classList.remove(inactive_content_classes);
  }
});
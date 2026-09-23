(function () {
  var names = {
    pending: "Name pending",
    avoriqo: "Avoriqo",
    zavleniq: "Zavleniq",
    kerveniq: "Kerveniq"
  };
  var root = document.documentElement;
  var stored = localStorage.getItem("brand-draft-name") || "pending";
  var lang = localStorage.getItem("brand-draft-lang") || "en";

  function applyBrand(key) {
    var safe = names[key] ? key : "pending";
    document.querySelectorAll("#wordmark, #cover-mark").forEach(function (node) {
      node.textContent = names.pending;
    });
    document.querySelectorAll("[data-brand]").forEach(function (button) {
      button.setAttribute("aria-pressed", button.getAttribute("data-brand") === safe ? "true" : "false");
    });
    var line = document.getElementById("preview-line");
    if (line) {
      line.textContent = safe === "pending" ? "未批准预览：无" : "未批准预览：" + names[safe];
    }
    localStorage.setItem("brand-draft-name", safe);
  }

  function applyLang(next) {
    root.setAttribute("data-lang", next);
    root.lang = next === "zh" ? "zh-Hans" : "en";
    var toggle = document.getElementById("lang");
    if (toggle) toggle.textContent = next === "zh" ? "EN" : "中文";
    localStorage.setItem("brand-draft-lang", next);
  }

  applyBrand(stored);
  applyLang(lang);

  document.querySelectorAll("[data-brand]").forEach(function (button) {
    button.addEventListener("click", function () {
      applyBrand(button.getAttribute("data-brand"));
    });
  });
  var toggle = document.getElementById("lang");
  if (toggle) {
    toggle.addEventListener("click", function () {
      applyLang(root.getAttribute("data-lang") === "zh" ? "en" : "zh");
    });
  }
})();

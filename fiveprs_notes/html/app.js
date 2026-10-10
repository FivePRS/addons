const text = document.getElementById("text");
const save = document.getElementById("save");
const status = document.getElementById("status");
const count = document.getElementById("count");

let saved = "";

function refresh() {
  const dirty = text.value !== saved;
  save.disabled = !dirty;
  status.textContent = dirty ? "Unsaved changes" : "Saved";
  count.textContent = `${text.value.length} / ${text.maxLength}`;
}

FivePRS.on("context", (context) => {
  if (!context) return;
  document.getElementById("who").textContent = context.onDuty
    ? `${context.callsign} · ${context.agency}`
    : context.name;
});

FivePRS.on("notes", ({ text: value, maxLength }) => {
  text.maxLength = maxLength;
  text.value = value;
  saved = value;
  refresh();
});

FivePRS.on("saved", () => {
  saved = text.value;
  refresh();
});

text.addEventListener("input", refresh);

save.addEventListener("click", () => {
  save.disabled = true;
  FivePRS.action("save", { text: text.value });
});

document.addEventListener("keydown", (event) => {
  if ((event.ctrlKey || event.metaKey) && event.key === "s") {
    event.preventDefault();
    if (!save.disabled) save.click();
  }
});

FivePRS.action("load");

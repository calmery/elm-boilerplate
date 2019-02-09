import "./index.scss";
import { register } from "./serviceWorker";
import { Elm } from "./Main.elm";

register();

export const flags = {
  message: "Hello World"
};

Elm.Main.init({
  flags: JSON.stringify(flags),
  node: document.body
});

console.log(process.env.NODE_ENV);

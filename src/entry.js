// SCSS

require('./style.scss');

// Elm

const flags = JSON.stringify({
  message: 'Hello World',
});

const Elm = require('./elm/Main.elm');

Elm.Main.fullscreen(flags);

// For tests

module.exports = {
  flags,
};

# Tidy

Jai bindings for [tidy-html5](https://github.com/htacg/tidy-html5).

## Footguns

* Careful: Despite all the options you can set, libtidy still seems to always return `&amp;` as `&amp;` instead of decoding it to `&`! Use `clean_node_text()` to decode `&amp;` and remove all other entities.




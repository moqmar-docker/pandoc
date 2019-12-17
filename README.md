# [Pandoc](https://pandoc.org/) on Docker

> If you need to convert files from one markup format into another,
> pandoc is your swiss-army knife.

This image provides the latest version of Pandoc (2.9) together with the
following software:
- [WeasyPrint](https://weasyprint.org/) &
  [wkhtmltopdf](https://pandoc.org/MANUAL.html)
- [TeX Live](https://www.tug.org/texlive/) Full Distribution
- Templates & Scripts:
  - [Pandocomatic](https://heerdebeer.org/Software/markdown/pandocomatic/)
  - [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template)
    in `/opt/eisvogel` with the alias `eisvogel`
  - If you're missing something here, feel free to [open an issue](https://github.com/moqmar-docker/pandoc/issues)

**Roadmap:**
- Add a few HTML-based templates for basic Markdown documents
- Add `to-html` and `to-pdf` scripts for very simple conversion of mixed
  Markdown/LaTeX documents

## Examples
**Basic Usage:**
```bash
docker run --rm -it -v "$PWD:/data" docker.io/momar/pandoc \
    pandoc -t html -o helloworld.pdf helloworld.md
```

**Using the Eisvogel Template:**
```bash
docker run --rm -it -v "$PWD:/data" docker.io/momar/pandoc \
    eisvogel -V lang=de -o helloworld.pdf helloworld.md
```

# Build the frontend into dist/
build:
    mkdir -p dist
    elm make src/Main.elm --output=dist/elm.js
    cp -r static/. dist/

watch:
    elm-live src/Main.elm -- --debug

# Build, then start the server
run: build
    cabal run

clean:
    rm -rf dist
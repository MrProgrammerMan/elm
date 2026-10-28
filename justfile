# Build the frontend into dist/
build:
    mkdir -p dist
    elm make src/Main.elm --output=dist/elm.js
    cp -r static/. dist/

# Build, then start the server
run: build
    cabal run

clean:
    rm -rf dist
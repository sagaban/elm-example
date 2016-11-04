BIN = ./node_modules/.bin
SRC = src
BUILD = build
CSS = assets/stylesheets
FONTS = assets/fonts
IMAGES = assets/images
HTML = src/index.html

# build: build-directory html js css fonts images
build: build-directory html js css images

build-directory:
	mkdir -p $(BUILD)

html:
	cp $(HTML) $(BUILD)/index.html

js:
	$(BIN)/elm make $(SRC)/Main.elm \
		--output $(BUILD)/app.js
	$(BIN)/uglifyjs --compress --mangle \
		--output $(BUILD)/app.min.js \
		$(BUILD)/app.js 2> /dev/null
	mv $(BUILD)/app.min.js $(BUILD)/app.js
	# $(BIN)/uglifyjs --compress --mangle \
	# 	--output $(BUILD)/setup.js \
	# 	$(SRC)/setup.js 2> /dev/null

css:
	cat $(CSS)/*.css | \
		$(BIN)/cleancss --output $(BUILD)/style.css

fonts:
	cp -r $(FONTS) $(BUILD)

images:
	cp -r $(IMAGES) $(BUILD)

watch:
	$(BIN)/chokidar "$(SRC)" "assets" -c "make"

browser-sync:
	$(BIN)/browser-sync start \
		--server $(BUILD) --files $(BUILD)

setup:
	yarn install

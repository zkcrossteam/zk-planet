JSFOLDER:=../src/games/planet/js
build:
	wasm-pack build --release --out-name gameplay --out-dir pkg
	cp pkg/gameplay.d.ts $(JSFOLDER)/gameplay.d.ts
	cp pkg/gameplay_bg.wasm $(JSFOLDER)/gameplay_bg.wasm
	cp pkg/gameplay_bg.wasm.d.ts $(JSFOLDER)/gameplay_bg.wasm.d.ts
	cp pkg/gameplay_bg.js $(JSFOLDER)/gameplay_bg.js
trace:
	wasm-interp pkg/output.wasm --run-all-exports  --trace > trace.log
	wc -l trace.log

clean:
	rm -rf pkg
	rm -rf ../src/js/gameplay.wasm
	rm -rf ../src/js/gameplay.d.ts

	



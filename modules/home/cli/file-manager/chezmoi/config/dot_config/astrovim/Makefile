FENNEL_SOURCE_DIR = .
FENNEL_OUTPUT_DIR = .
FENNEL_SOURCES = $(shell find $(FENNEL_SOURCE_DIR) -name '*.fnl')
FENNEL_OUTPUTS = $(patsubst $(FENNEL_SOURCE_DIR)/%.fnl,$(FENNEL_OUTPUT_DIR)/%.lua,$(FENNEL_SOURCES))

all: $(FENNEL_OUTPUTS)

$(FENNEL_OUTPUT_DIR)/%.lua: $(FENNEL_SOURCE_DIR)/%.fnl
	@mkdir -p $(FENNEL_OUTPUT_DIR)
	fnlfmt --fix $<
	fennel -c $< > $@

clean:
	rm -rf $(FENNEL_OUTPUTS)

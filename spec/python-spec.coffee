describe "Rapydscript grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-rapydscript")

    runs ->
      grammar = atom.syntax.grammarForScopeName("source.pyj")

  it "parses the grammar", ->
    expect(grammar).toBeDefined()
    expect(grammar.scopeName).toBe "source.pyj"

  it "tokenizes multi-line strings", ->
    tokens = grammar.tokenizeLines('"1\\\n2"')

    # Line 0
    expect(tokens[0][0].value).toBe '"'
    expect(tokens[0][0].scopes).toEqual ['source.pyj', 'string.quoted.double.single-line.pyj', 'punctuation.definition.string.begin.pyj']

    expect(tokens[0][1].value).toBe '1'
    expect(tokens[0][1].scopes).toEqual ['source.pyj', 'string.quoted.double.single-line.pyj']

    expect(tokens[0][2].value).toBe '\\'
    expect(tokens[0][2].scopes).toEqual ['source.pyj', 'string.quoted.double.single-line.pyj', 'constant.character.escape.newline.pyj']

    expect(tokens[0][3]).not.toBeDefined()

    # Line 1
    expect(tokens[1][0].value).toBe '2'
    expect(tokens[1][0].scopes).toEqual ['source.pyj', 'string.quoted.double.single-line.pyj']

    expect(tokens[1][1].value).toBe '"'
    expect(tokens[1][1].scopes).toEqual ['source.pyj', 'string.quoted.double.single-line.pyj', 'punctuation.definition.string.end.pyj']

    expect(tokens[1][2]).not.toBeDefined()

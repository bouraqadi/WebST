Extension { #name : 'String' }

{ #category : '*WebST-Base' }
String >> asKebabCase [

	^ self species streamContents: [ :str |
		  self withIndexDo: [ :char :index | char writeKebabCaseOn: str index: index] ]
]

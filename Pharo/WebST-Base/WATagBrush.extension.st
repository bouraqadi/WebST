Extension { #name : #WATagBrush }

{ #category : #'*WebST-Base' }
WATagBrush >> attributeNameFromJs: attributeJsName [

	^ String streamContents: [ :str |
		  attributeJsName do: [ :char |
			  self writeOn: str attributeNameChar: char ] ]

]

{ #category : #'*WebST-Base' }
WATagBrush >> dataAttributes: attributeAssociations [

	attributeAssociations asDictionary keysAndValuesDo: [
		:attributeJsName
		:attributeValue |
		self renderDataAttribute: attributeJsName value: attributeValue ]
]

{ #category : #'*WebST-Base' }
WATagBrush >> renderDataAttribute: attributeJsName value: attributeValue [
	self 
		dataAttributeAt: (self attributeNameFromJs: attributeJsName)
		put: attributeValue
]

{ #category : #'*WebST-Base' }
WATagBrush >> writeOn: aStream attributeNameChar: aCharacter [

	aCharacter isLowercase ifTrue: [ ^ aStream << aCharacter ].
	aStream
		<< $-;
		<< aCharacter asLowercase
]

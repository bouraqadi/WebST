Extension { #name : 'WATagBrush' }

{ #category : '*WebST-Base' }
WATagBrush >> dataAttributes: attributeAssociations [

	attributeAssociations asDictionary keysAndValuesDo: [
		:attributeJsName
		:attributeValue |
		self renderDataAttribute: attributeJsName value: attributeValue ]
]

{ #category : '*WebST-Base' }
WATagBrush >> renderDataAttribute: attributeJsName value: attributeValue [

	self
		dataAttributeAt: attributeJsName asKebabCase 
		put: attributeValue
]

Extension { #name : 'Character' }

{ #category : '*WebST-Base' }
Character >> writeKebabCaseOn: aStream index: index [

	(index > 1 and: [ self isUppercase ]) ifTrue: [
		aStream << $- ].
	aStream << self asLowercase
]

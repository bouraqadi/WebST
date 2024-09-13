Class {
	#name : 'WsComponentClassFinder',
	#superclass : 'Object',
	#instVars : [
		'componentClasses',
		'analyzedClasses'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'analyzing' }
WsComponentClassFinder class >> allComponentClassesFrom: aClass [
	^self new allComponentClassesFrom: aClass

]

{ #category : 'analyzing' }
WsComponentClassFinder >> allComponentClassesFrom: aClass [

	componentClasses := IdentitySet new.
	analyzedClasses := IdentitySet new.
	aClass findComponentClassesWith: self.
	^ componentClasses asArray
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeClass: aClass [

	(analyzedClasses includes: aClass) ifTrue: [ ^ self ].
	analyzedClasses add: aClass.
	self analyzeClassesReferencedBy: aClass
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeClassesReferencedBy: aClass [

	aClass referencedClasses do: [ :each |
		each findComponentClassesWith: self ].
	self analyzeClass: aClass class.
	self analyzeSuperclassOf: aClass
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeComponentClass: aClass [

	(componentClasses includes: aClass) ifTrue: [ ^ self ].
	componentClasses add: aClass.
	self analyzeClass: aClass
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeSingleComponentAppClass: aClass [

	"Sometimes the root component class is referenced via an instance variable"
	self analyzeClass: aClass.
	[aClass rootComponentClass ] on: Error do: [:ex| ^self ].
	aClass rootComponentClass ifNil: [ ^self ].
	aClass rootComponentClass findComponentClassesWith: self
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeSuperclassOf: aClass [

	aClass superclass ifNil: [ ^ self ].
	aClass superclass findComponentClassesWith: self
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeViewBasedAppClass: aClass [

	"Sometimes the view class is referenced via an instance variable"
	self analyzeClass: aClass.
	aClass isAbstract ifTrue: [ ^self ].
	aClass viewClass findComponentClassesWith: self
]

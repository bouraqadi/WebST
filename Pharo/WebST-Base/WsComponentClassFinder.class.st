Class {
	#name : 'WsComponentClassFinder',
	#superclass : 'Object',
	#instVars : [
		'componentClasses',
		'analyzedClasses'
	],
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'analyzing' }
WsComponentClassFinder class >> allComponentClassesFrom: aClass [
	^self new allComponentClassesFrom: aClass

]

{ #category : 'analyzing' }
WsComponentClassFinder >> addComponentClass: aClass [

	componentClasses add: aClass
]

{ #category : 'analyzing' }
WsComponentClassFinder >> allComponentClassesFrom: aClass [

	aClass findComponentClassesWith: self.
	^ self componentClasses
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
	self addComponentClass: aClass.
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

{ #category : 'accessing' }
WsComponentClassFinder >> componentClasses [
	^componentClasses
]

{ #category : 'initialization' }
WsComponentClassFinder >> initialize [ 
	super initialize.
	componentClasses := IdentitySet new.
	analyzedClasses := IdentitySet new.

]

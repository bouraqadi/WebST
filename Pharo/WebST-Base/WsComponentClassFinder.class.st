Class {
	#name : 'WsComponentClassFinder',
	#superclass : 'Object',
	#instVars : [
		'componentClasses',
		'visitedViewClasses'
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
	visitedViewClasses := IdentitySet new.
	aClass findComponentClassesWith: self.
	^ componentClasses asArray
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeClassReferencedBy: aClass [


		aClass referencedClasses do: [ :each |
			each findComponentClassesWith: self ] 
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeComponentClass: aClass [

	(componentClasses includes: aClass) ifTrue: [ ^ self ].
	componentClasses add: aClass.
	aClass viewClass findComponentClassesWith: self
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeSingleComponentAppClass: aClass [

	aClass rootComponentClass findComponentClassesWith:
		self
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeSuperclassOf: aClass [
	aClass superclass ifNil: [ ^ self ].
	aClass superclass findComponentClassesWith: self
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeViewBasedAppClass: aClass [

	aClass viewClass findComponentClassesWith: self
]

{ #category : 'analyzing' }
WsComponentClassFinder >> analyzeViewClass: aViewClass [

	(visitedViewClasses includes: aViewClass) ifTrue: [ ^ self ].
	visitedViewClasses add: aViewClass.
	aViewClass referencedClasses do: [ :aClass |
		aClass findComponentClassesWith: self ].
	self analyzeSuperclassOf: aViewClass
]

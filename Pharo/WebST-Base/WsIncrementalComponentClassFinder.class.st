Class {
	#name : 'WsIncrementalComponentClassFinder',
	#superclass : 'WsComponentClassFinder',
	#instVars : [
		'newComponentClasses'
	],
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'analyzing' }
WsIncrementalComponentClassFinder >> addComponentClass: aClass [
	newComponentClasses add: aClass.
	super addComponentClass: aClass 
]

{ #category : 'analyzing' }
WsIncrementalComponentClassFinder >> allNewComponentClassesFrom: aClass [

	self resetNewComponentClasses.
	aClass findComponentClassesWith: self.
	^ self newComponentClasses
]

{ #category : 'initialization' }
WsIncrementalComponentClassFinder >> initialize [

	super initialize.
	self resetNewComponentClasses
]

{ #category : 'accessing' }
WsIncrementalComponentClassFinder >> newComponentClasses [
	^newComponentClasses
]

{ #category : 'initialization' }
WsIncrementalComponentClassFinder >> resetNewComponentClasses [

	newComponentClasses := IdentitySet new
]

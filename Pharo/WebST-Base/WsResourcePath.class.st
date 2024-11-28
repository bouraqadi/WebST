Class {
	#name : 'WsResourcePath',
	#superclass : 'Object',
	#instVars : [
		'pathString'
	],
	#category : 'WebST-Base-Resources',
	#package : 'WebST-Base',
	#tag : 'Resources'
}

{ #category : 'instance creation' }
WsResourcePath class >> pathString: aString [
	^self new pathString: aString; yourself
]

{ #category : 'accessing' }
WsResourcePath >> basicPathString [

	^ pathString
]

{ #category : 'accessing' }
WsResourcePath >> pathString [

	^WsResourceFolder fullPathFrom: self basicPathString 
]

{ #category : 'accessing' }
WsResourcePath >> pathString: anObject [

	pathString := anObject
]

{ #category : 'rendering' }
WsResourcePath >> renderOn: renderer [

	renderer html: self pathString
]

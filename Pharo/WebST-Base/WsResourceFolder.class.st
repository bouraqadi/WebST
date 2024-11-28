Class {
	#name : 'WsResourceFolder',
	#superclass : 'Object',
	#instVars : [
		'rootPath'
	],
	#classInstVars : [
		'default'
	],
	#category : 'WebST-Base-Resources',
	#package : 'WebST-Base',
	#tag : 'Resources'
}

{ #category : 'default instance' }
WsResourceFolder class >> default [
	^default ifNil: [ default := self new ]
]

{ #category : 'accessing' }
WsResourceFolder class >> defaultRootPath [

	^ 'Resources/'
]

{ #category : 'accessing' }
WsResourceFolder class >> fullPathFrom: pathString [
	^self default fullPathFrom: pathString
]

{ #category : 'default instance' }
WsResourceFolder class >> resetDefault [

	<script>
	default := nil
]

{ #category : 'accessing' }
WsResourceFolder class >> rootPath [

	^ self default rootPath
]

{ #category : 'accessing' }
WsResourceFolder class >> rootPath: newPath [

	self default rootPath: newPath
]

{ #category : 'initialization' }
WsResourceFolder >> defaultRootPath [
	^ self class defaultRootPath
]

{ #category : 'accessing' }
WsResourceFolder >> fullPathFrom: aPathString [

	| normalizedPathString |
	normalizedPathString := (aPathString notEmpty and: [aPathString first = $/])
		                        ifTrue: [ aPathString allButFirst ]
		                        ifFalse: [ aPathString ].
	^ self rootPath , normalizedPathString
]

{ #category : 'initialization' }
WsResourceFolder >> initialize [

	super initialize.
	self rootPath: self defaultRootPath
]

{ #category : 'accessing' }
WsResourceFolder >> rootPath [
	^rootPath
]

{ #category : 'accessing' }
WsResourceFolder >> rootPath: newPath [

	rootPath := (newPath notEmpty and: [newPath last = $/])
		            ifTrue: [ newPath ]
		            ifFalse: [ newPath copyWith: $/ ]
]

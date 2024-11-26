Class {
	#name : 'WsResourceRegistry',
	#superclass : 'Object',
	#instVars : [
		'rootPath',
		'pathDict'
	],
	#category : 'WebST-Base-Resources',
	#package : 'WebST-Base',
	#tag : 'Resources'
}

{ #category : 'initialization' }
WsResourceRegistry class >> defaultRootPath [
	^'../Resources/'
]

{ #category : 'accessing path ' }
WsResourceRegistry >> at: id putPath: aPathString [

	| normalizedPathString |
	normalizedPathString := aPathString first = $/
		                        ifTrue: [ aPathString allButFirst ]
		                        ifFalse: [ aPathString ].
	pathDict at: id put: normalizedPathString
]

{ #category : 'initialization' }
WsResourceRegistry >> defaultRootPath [
	^ self class defaultRootPath
]

{ #category : 'initialization' }
WsResourceRegistry >> initialize [

	super initialize.
	pathDict := Dictionary new.
	self rootPath: self defaultRootPath
]

{ #category : 'accessing path ' }
WsResourceRegistry >> pathTo: aSymbol [
	| relativePath |
	relativePath := pathDict at: aSymbol.
	^self rootPath, relativePath
]

{ #category : 'accessing' }
WsResourceRegistry >> rootPath [
	^rootPath
]

{ #category : 'accessing' }
WsResourceRegistry >> rootPath: newPath [

	rootPath := (newPath notEmpty and: [newPath last = $/])
		            ifTrue: [ newPath ]
		            ifFalse: [ newPath copyWith: $/ ]
]

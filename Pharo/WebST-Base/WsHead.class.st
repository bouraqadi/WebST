Class {
	#name : 'WsHead',
	#superclass : 'WsCompositeTagElement',
	#instVars : [
		'titleElement'
	],
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'accessing' }
WsHead >> addMeta: aBlock [

	| meta |
	meta := WAMetaElement new.
	aBlock value: meta.
	self add: meta
]

{ #category : 'initialization' }
WsHead >> initialize [

	super initialize.
	self addMeta: [ :meta | meta charset: 'utf-8' ].
	titleElement := WsTitle new.
	self add: titleElement
]

{ #category : 'accessing' }
WsHead >> tag [
	^#head
]

{ #category : 'accessing' }
WsHead >> title: aString [

	titleElement text: aString
]

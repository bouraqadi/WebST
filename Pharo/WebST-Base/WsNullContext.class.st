"
Allows inheriting from Seaside classes with little changes. See `WsRenderer` and `WsFormTag`
"
Class {
	#name : 'WsNullContext',
	#superclass : 'Object',
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'accessing' }
WsNullContext >> actionUrl [
	^nil
]

{ #category : 'parameters' }
WsNullContext >> charSet [
	^nil
]

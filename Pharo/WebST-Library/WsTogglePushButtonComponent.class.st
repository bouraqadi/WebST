Class {
	#name : 'WsTogglePushButtonComponent',
	#superclass : 'WsToggleIconTextComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'accessing' }
WsTogglePushButtonComponent class >> defaultOffButtonCssAttribute [

	^ 'btn-danger'
]

{ #category : 'accessing' }
WsTogglePushButtonComponent class >> defaultOnButtonCssAttribute [
	^'btn-success'
]

{ #category : 'accessing' }
WsTogglePushButtonComponent class >> tagName [

	^'ws-toggle-push-button'
]

{ #category : 'accessing' }
WsTogglePushButtonComponent class >> viewClass [ 
	<pharoJsSkip>
	^WsTogglePushButtonView 
]

{ #category : 'accessing' }
WsTogglePushButtonComponent >> defaultOffButtonCssAttribute [
	^self class defaultOffButtonCssAttribute
]

{ #category : 'accessing' }
WsTogglePushButtonComponent >> defaultOnButtonCssAttribute [
	^self class defaultOnButtonCssAttribute
]

{ #category : 'accessing' }
WsTogglePushButtonComponent >> offButton [
	^offView 
]

{ #category : 'accessing' }
WsTogglePushButtonComponent >> offButtonCssAttribute [

	^ self
		  dataAttributeAt: #offButtonCss
		  ifAbsent: [ self defaultOffButtonCssAttribute ]
]

{ #category : 'accessing' }
WsTogglePushButtonComponent >> onButton [
	^onView 
]

{ #category : 'accessing' }
WsTogglePushButtonComponent >> onButtonCssAttribute [
	^self dataAttributeAt: #onButtonCss ifAbsent: [ self defaultOnButtonCssAttribute ]
]

{ #category : 'initialization' }
WsTogglePushButtonComponent >> postConnectInitialize [

	super postConnectInitialize.
	self onButton classList add: self onButtonCssAttribute.
	self offButton classList add: self offButtonCssAttribute.

]

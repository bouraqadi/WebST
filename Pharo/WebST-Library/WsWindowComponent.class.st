Class {
	#name : #WsWindowComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'windowBody'
	],
	#category : #'WebST-Library-Windows'
}

{ #category : #'class initialization' }
WsWindowComponent class >> tagName [

	^'ws-window'
]

{ #category : #accessing }
WsWindowComponent class >> viewClass [

	<pharoJsSkip>
	^WsWindowView 
]

{ #category : #acting }
WsWindowComponent >> close [

	self remove
]

{ #category : #accessing }
WsWindowComponent >> closeButton [

	^ view querySelector: '.closeButton'
]

{ #category : #initialization }
WsWindowComponent >> initView [

	super initView.
	windowBody := view querySelector: '.windowBody'.
	self onClickElement: self minimizeButton do: [ self toggleMinimize ].
	self onClickElement: self maximizeButton do: [ self toggleMaximize ].
	self onClickElement: self closeButton do: [ self close ].

]

{ #category : #acting }
WsWindowComponent >> isBodyHidden [

	^ (window getComputedStyle: windowBody) display == 'none'
]

{ #category : #accessing }
WsWindowComponent >> maximizeButton [

	^ view querySelector: '.maximizeButton'
]

{ #category : #accessing }
WsWindowComponent >> minimizeButton [ 
	^view querySelector: '.minimizeButton'
]

{ #category : #acting }
WsWindowComponent >> toggleMaximize [

	document fullscreenElement == self ifTrue: [ ^document exitFullscreen ].
	self requestFullscreen
]

{ #category : #acting }
WsWindowComponent >> toggleMinimize [

	self show: self isBodyHidden element: windowBody
]

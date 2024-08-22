Class {
	#name : 'WsFullScreenToggleComponent',
	#superclass : 'WsToggleIconTextComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'class initialization' }
WsFullScreenToggleComponent class >> defaultOffIconAttribute [

	^ 'bi-fullscreen-exit'
]

{ #category : 'class initialization' }
WsFullScreenToggleComponent class >> defaultOnIconAttribute [

	^ 'bi-fullscreen'
]

{ #category : 'class initialization' }
WsFullScreenToggleComponent class >> tagName [

	^ 'ws-fullscreen-toggle-icons'
]

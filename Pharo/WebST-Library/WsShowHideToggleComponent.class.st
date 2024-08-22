"
I use show/hide icons that are often needed for passwords and secret fields.
"
Class {
	#name : 'WsShowHideToggleComponent',
	#superclass : 'WsToggleIconTextComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'initialization' }
WsShowHideToggleComponent class >> defaultOffIconAttribute [

	^ 'bi-eye-slash-fill'
]

{ #category : 'initialization' }
WsShowHideToggleComponent class >> defaultOnIconAttribute [

	^ 'bi-eye-fill'
]

{ #category : 'class initialization' }
WsShowHideToggleComponent class >> tagName [

	^ 'ws-show-hide-toggle-icons'
]

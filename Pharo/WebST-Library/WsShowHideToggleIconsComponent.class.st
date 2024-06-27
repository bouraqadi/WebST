"
I use show/hide icons that are often needed for passwords and secret fields.
"
Class {
	#name : #WsShowHideToggleIconsComponent,
	#superclass : #WsToggleIconsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebST-Library-Buttons'
}

{ #category : #initialization }
WsShowHideToggleIconsComponent class >> defaultOffIconAttribute [

	^ 'bi-eye-slash-fill'
]

{ #category : #initialization }
WsShowHideToggleIconsComponent class >> defaultOnIconAttribute [

	^ 'bi-eye-fill'
]

{ #category : #'class initialization' }
WsShowHideToggleIconsComponent class >> tagName [

	^ 'ws-show-hide-toggle-icons'
]

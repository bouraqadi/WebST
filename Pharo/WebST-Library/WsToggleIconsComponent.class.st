Class {
	#name : #WsToggleIconsComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : #'WebST-Library-Buttons'
}

{ #category : #accessing }
WsToggleIconsComponent class >> modelClass [

	^WsToggleModel 
]

{ #category : #'class initialization' }
WsToggleIconsComponent class >> tagName [

	'ws-toggle-icons'
]

{ #category : #accessing }
WsToggleIconsComponent class >> viewClass [

	<pharoJsSkip>
	^WsToggleIconsView 
]

"
I represent an app that is built using a single root web component. 
"
Class {
	#name : 'WsSingleComponentApp',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'WsTSingleComponentApp',
	#classTraits : 'WsTSingleComponentApp classTrait',
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'accessing' }
WsSingleComponentApp class >> defaultAppFolderName [

	<pharoJsSkip>
	| aWsSingleComponentApp |
	aWsSingleComponentApp := self new.
	^ aWsSingleComponentApp componentClass name , '-Test'
]

{ #category : 'accessing' }
WsSingleComponentApp class >> title [

	<pharoJsSkip> 
	^ self componentClass name
]

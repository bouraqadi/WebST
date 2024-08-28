Class {
	#name : 'WsToggleView',
	#superclass : 'WsBootstrapIcons1View',
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'rendering' }
WsToggleView >> renderOffViewContentOn: html [

	self renderViewContentOn: html
]

{ #category : 'rendering' }
WsToggleView >> renderOffViewOn: html [

	(self viewBrushOn: html)
		id: 'offView';
		with: [ self renderOffViewContentOn: html ]
]

{ #category : 'rendering' }
WsToggleView >> renderOnViewContentOn: html [

	self renderViewContentOn: html
]

{ #category : 'rendering' }
WsToggleView >> renderOnViewOn: html [

	(self viewBrushOn: html)
		id: 'onView';
		with: [ self renderOnViewContentOn: html ].

]

{ #category : 'rendering' }
WsToggleView >> renderOuterHtmlOn: html [

	self renderOnViewOn: html.
	self renderOffViewOn: html.

]

{ #category : 'rendering' }
WsToggleView >> renderViewContentOn: html [

	self subclassResponsibility 
]

{ #category : 'rendering' }
WsToggleView >> viewBrushOn: html [

	^self subclassResponsibility 
]

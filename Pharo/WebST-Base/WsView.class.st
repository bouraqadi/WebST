Class {
	#name : 'WsView',
	#superclass : 'WsElement',
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'accessing' }
WsView class >> allGlobalResources [

	^ self new allGlobalResources
]

{ #category : 'rendering' }
WsView class >> html [
	^self htmlWith: [ : ignore |  ]
]

{ #category : 'rendering' }
WsView class >> htmlWith: initBlock [
	| view |
	view := self new.
	initBlock value: view.
	^view html
]

{ #category : 'rendering' }
WsView class >> renderOn: html [

	self renderOn: html with: [ :ignore |  ]
]

{ #category : 'rendering' }
WsView class >> renderOn: renderer with: initBlock [ 
	renderer renderViewClass: self with: initBlock
]

{ #category : 'accessing' }
WsView >> allGlobalResources [

	^(self renderClass render: self)
		  globalResources
]

{ #category : 'rendering' }
WsView >> html [

	^self renderClass htmlWithLocalResourcesFrom: self
]

{ #category : 'rendering' }
WsView >> renderOn: html [
	html renderView: self
]

{ #category : 'rendering' }
WsView >> renderOuterHtmlOn: html [

	self subclassResponsibility
]

{ #category : 'accessing' }
WsView >> resources [

	^ #(  )
]

Class {
	#name : #WsView,
	#superclass : #WsElement,
	#category : #'WebSt-Base-Views'
}

{ #category : #accessing }
WsView class >> allGlobalResources [

	^ self new allGlobalResources
]

{ #category : #rendering }
WsView class >> renderOn: html [

	html render: self new
]

{ #category : #accessing }
WsView >> allGlobalResources [

	^(self renderClass render: self)
		  globalResources
]

{ #category : #rendering }
WsView >> html [

	^self renderClass htmlWithLocalResourcesFrom: self
]

{ #category : #rendering }
WsView >> renderOn: html [
	html renderView: self
]

{ #category : #rendering }
WsView >> renderOuterHtmlOn: html [

	self subclassResponsibility
]

{ #category : #accessing }
WsView >> resources [

	^ #(  )
]

Class {
	#name : #WsWindowView,
	#superclass : #WsBootstrap5Icons1View,
	#category : #'WebST-Library-Windows'
}

{ #category : #rendering }
WsWindowView >> renderBodyContentsOn: html [

			html div
				class: 'container mt-3';
				with: [
					html div
						class: 'alert alert-light fs-3 text-center';
						with: 'No Contents' ] 
]

{ #category : #rendering }
WsWindowView >> renderBodyOn: html [

	html div
		class: 'windowBody border border-1 border-dark flex-fill';
		with: [self renderBodyContentsOn: html]
]

{ #category : #rendering }
WsWindowView >> renderHeadingButtonOn: html class: classString iconClass: iconClasssString [ 

	| button |
	button := html button.
	button
		bePush;
		class: classString;
		with: [ html icon class: iconClasssString ]
]

{ #category : #rendering }
WsWindowView >> renderHeadingButtonsOn: html [

	self
		renderHeadingButtonOn: html
		class: 'closeButton btn btn-danger me-1'
		iconClass: 'bi bi-x-lg'.
	self
		renderHeadingButtonOn: html
		class: 'minimizeButton btn btn-warning me-1'
		iconClass: 'bi bi-dash-lg'.
	self
		renderHeadingButtonOn: html
		class: 'maximizeButton btn btn-success'
		iconClass: 'bi bi-arrows-angle-expand'
]

{ #category : #rendering }
WsWindowView >> renderHeadingOn: html [

	html div
		class: 'd-flex bg bg-dark text-light p-2';
		with: [
			self renderHeadingButtonsOn: html.
			self renderHeadingTitleOn: html ]
]

{ #category : #rendering }
WsWindowView >> renderHeadingTitleOn: html [

	html div
		class: 'mx-auto align-self-center fs-3';
		with: 'WebST Window'
]

{ #category : #rendering }
WsWindowView >> renderOuterHtmlOn: html [

	html div
		class: 'd-flex flex-column';
		with: [ 
			self renderHeadingOn: html.
			self renderBodyOn: html ]
]

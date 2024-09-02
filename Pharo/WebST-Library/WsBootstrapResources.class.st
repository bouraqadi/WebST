Class {
	#name : 'WsBootstrapResources',
	#superclass : 'SharedPool',
	#classVars : [
		'Bootstrap5o0o2',
		'Bootstrap5o3o3',
		'BootstrapIcons1o11o3'
	],
	#category : 'WebST-Library-Bootstrap',
	#package : 'WebST-Library',
	#tag : 'Bootstrap'
}

{ #category : 'accesing' }
WsBootstrapResources class >> bootstrap5 [

	^ self bootstrap5o3o3 
]

{ #category : 'accesing' }
WsBootstrapResources class >> bootstrap5o0o2 [

	^ Bootstrap5o0o2
]

{ #category : 'accesing' }
WsBootstrapResources class >> bootstrap5o3o3 [

	^ Bootstrap5o3o3
]

{ #category : 'accesing' }
WsBootstrapResources class >> bootstrapIcons1 [

	^ self bootstrapIcons1o11o3
	
]

{ #category : 'accesing' }
WsBootstrapResources class >> bootstrapIcons1o11o3 [
	^BootstrapIcons1o11o3
]

{ #category : 'class initialization' }
WsBootstrapResources class >> initBootstrap5o0o2 [

	Bootstrap5o0o2 := WsCompositeResource withAll: {
			                  (WsCssLink
				                   url:
					                   'https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css'
				                   integrity:
					                   'sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC').
			                  (WsJsScript
				                   url:
					                   'https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'
				                   integrity:
					                   'sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM') }
]

{ #category : 'class initialization' }
WsBootstrapResources class >> initBootstrap5o3o3 [

	Bootstrap5o3o3 := WsCompositeResource withAll: {
			                  (WsCssLink
				                   url:
					                   'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css'
				                   integrity:
					                   'sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH').
			                  (WsJsScript
				                   url:
					                   'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'
				                   integrity:
					                   'sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz') }
]

{ #category : 'class initialization' }
WsBootstrapResources class >> initBootstrapIcons1o11o3 [

	BootstrapIcons1o11o3 := WsCssLink new url: 'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css'
]

{ #category : 'class initialization' }
WsBootstrapResources class >> initialize [

	self initBootstrap5o3o3.
	self initBootstrap5o0o2.
	self initBootstrapIcons1o11o3
]

;; FundMatch

(define-map data principal uint)
(define-data-var counter uint u0)

(define-public (store (value uint))
    (ok (map-set data tx-sender value)))

(define-read-only (retrieve (user principal))
    (ok (default-to u0 (map-get? data user))))

(define-public (increment-counter)
    (ok (var-set counter (+ (var-get counter) u1))))

(define-public (decrement-counter)
    (let ((current (var-get counter)))
        (ok (var-set counter (if (> current u0) (- current u1) u0)))))


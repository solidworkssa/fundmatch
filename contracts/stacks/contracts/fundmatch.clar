;; FundMatch Clarity Contract
;; Quadratic funding platform for public goods.


(define-map grants
    uint
    {
        recipient: principal,
        total-donated: uint
    }
)
(define-data-var grant-nonce uint u0)

(define-public (create-grant (recipient principal))
    (let ((id (var-get grant-nonce)))
        (map-set grants id {recipient: recipient, total-donated: u0})
        (var-set grant-nonce (+ id u1))
        (ok id)
    )
)

(define-public (donate (id uint) (amount uint))
    (let ((g (unwrap! (map-get? grants id) (err u404))))
        (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))
        (map-set grants id (merge g {total-donated: (+ (get total-donated g) amount)}))
        (ok true)
    )
)


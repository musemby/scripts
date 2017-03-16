  GroupAggregate  (cost=549312.39..571189.23 rows=243076 width=1103) (actual time=15367.707..20805.977 rows=7885 loops=1)
   Group Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
   ->  Sort  (cost=549312.39..549920.08 rows=243076 width=1103) (actual time=15367.658..16911.313 rows=331911 loops=1)
         Sort Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
         Sort Method: external merge  Disk: 341560kB
         ->  Hash Join  (cost=218936.68..293270.96 rows=243076 width=1103) (actual time=2317.188..9770.134 rows=331911 loops=1)
               Hash Cond: (beneficiaries_beneficiarydata.beneficiary_id = beneficiaries_beneficiary.id)
               ->  Nested Loop  (cost=179776.68..180098.91 rows=243076 width=1099) (actual time=2054.506..4501.359 rows=331911 loops=1)
                     ->  HashAggregate  (cost=179776.26..179778.26 rows=200 width=4) (actual time=2054.458..2202.598 rows=331911 loops=1)
                           Group Key: u0.id
                           ->  Unique  (cost=173926.32..176357.07 rows=273535 width=16) (actual time=1581.757..1870.706 rows=331911 loops=1)
                                 ->  Sort  (cost=173926.32..175141.70 rows=486151 width=16) (actual time=1581.756..1769.520 rows=486151 loops=1)
                                       Sort Key: u0.beneficiary_id, u0."timestamp"
                                       Sort Method: external merge  Disk: 12336kB
                                       ->  Hash Join  (cost=21368.98..119697.82 rows=486151 width=16) (actual time=146.963..1087.635 rows=486151 loops=1)
                                             Hash Cond: (u0.beneficiary_id = u1.id)
                                             ->  Seq Scan on beneficiaries_beneficiarydata u0  (cost=0.00..82218.51 rows=486151 width=20) (actual time=0.004..339.911 rows=486151 loops=1)
                                             ->  Hash  (cost=15923.09..15923.09 rows=331911 width=4) (actual time=146.832..146.832 rows=331911 loops=1)
                                                   Buckets: 16384  Batches: 4  Memory Usage: 2930kB
                                                   ->  Index Only Scan using beneficiaries_beneficiary_pkey on beneficiaries_beneficiary u1  (cost=0.42..15923.09 rows=331911 width=4) (actual time=0.015..68.019 rows=331911 loops=1)
                                                         Heap Fetches: 0
                     ->  Index Scan using beneficiaries_beneficiarydata_pkey on beneficiaries_beneficiarydata  (cost=0.42..1.59 rows=1 width=1103) (actual time=0.006..0.006 rows=1 loops=331911)
                           Index Cond: (id = u0.id)
               ->  Hash  (cost=33714.11..33714.11 rows=331911 width=8) (actual time=257.379..257.379 rows=331911 loops=1)
                     Buckets: 16384  Batches: 4  Memory Usage: 3256kB
                     ->  Seq Scan on beneficiaries_beneficiary  (cost=0.00..33714.11 rows=331911 width=8) (actual time=0.929..171.480 rows=331911 loops=1)
 Planning time: 1.355 ms
 Execution time: 22854.415 ms

(increased work_mem)
  GroupAggregate  (cost=228878.39..250755.23 rows=243076 width=1103) (actual time=10513.187..14497.223 rows=7885 loops=1)
   Group Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
   ->  Sort  (cost=228878.39..229486.08 rows=243076 width=1103) (actual time=10513.139..10578.061 rows=331911 loops=1)
         Sort Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
         Sort Method: quicksort  Memory: 412768kB
         ->  Hash Join  (cost=201038.68..207133.96 rows=243076 width=1103) (actual time=2075.809..8728.539 rows=331911 loops=1)
               Hash Cond: (beneficiaries_beneficiarydata.beneficiary_id = beneficiaries_beneficiary.id)
               ->  Nested Loop  (cost=163175.68..163497.91 rows=243076 width=1099) (actual time=1744.395..4349.014 rows=331911 loops=1)
                     ->  HashAggregate  (cost=163175.26..163177.26 rows=200 width=4) (actual time=1744.350..1895.418 rows=331911 loops=1)
                           Group Key: u0.id
                           ->  Unique  (cost=157325.32..159756.07 rows=273535 width=16) (actual time=1350.942..1537.673 rows=331911 loops=1)
                                 ->  Sort  (cost=157325.32..158540.70 rows=486151 width=16) (actual time=1350.939..1425.852 rows=486151 loops=1)
                                       Sort Key: u0.beneficiary_id, u0."timestamp"
                                       Sort Method: quicksort  Memory: 35077kB
                                       ->  Hash Join  (cost=20071.98..111405.82 rows=486151 width=16) (actual time=176.683..1049.214 rows=486151 loops=1)
                                             Hash Cond: (u0.beneficiary_id = u1.id)
                                             ->  Seq Scan on beneficiaries_beneficiarydata u0  (cost=0.00..82218.51 rows=486151 width=20) (actual time=0.003..289.654 rows=486151 loops=1)
                                             ->  Hash  (cost=15923.09..15923.09 rows=331911 width=4) (actual time=176.384..176.384 rows=331911 loops=1)
                                                   Buckets: 65536  Batches: 1  Memory Usage: 11669kB
                                                   ->  Index Only Scan using beneficiaries_beneficiary_pkey on beneficiaries_beneficiary u1  (cost=0.42..15923.09 rows=331911 width=4) (actual time=0.014..76.183 rows=331911 loops=1)
                                                         Heap Fetches: 0
                     ->  Index Scan using beneficiaries_beneficiarydata_pkey on beneficiaries_beneficiarydata  (cost=0.42..1.59 rows=1 width=1103) (actual time=0.006..0.007 rows=1 loops=331911)
                           Index Cond: (id = u0.id)
               ->  Hash  (cost=33714.11..33714.11 rows=331911 width=8) (actual time=331.188..331.188 rows=331911 loops=1)
                     Buckets: 65536  Batches: 1  Memory Usage: 12966kB
                     ->  Seq Scan on beneficiaries_beneficiary  (cost=0.00..33714.11 rows=331911 width=8) (actual time=0.650..207.131 rows=331911 loops=1)
 Planning time: 1.098 ms
 Execution time: 14506.241 ms


(payer_slade_code indexed)
 GroupAggregate  (cost=538184.54..560061.02 rows=243072 width=1106) (actual time=17252.638..22657.317 rows=7884 loops=1)
   Group Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
   ->  Sort  (cost=538184.54..538792.22 rows=243072 width=1106) (actual time=17250.900..18775.659 rows=331910 loops=1)
         Sort Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
         Sort Method: external merge  Disk: 341568kB
         ->  Hash Join  (cost=206152.72..280484.51 rows=243072 width=1106) (actual time=2299.426..9769.226 rows=331910 loops=1)
               Hash Cond: (beneficiaries_beneficiarydata.beneficiary_id = beneficiaries_beneficiary.id)
               ->  Nested Loop  (cost=182282.75..182604.57 rows=243072 width=1102) (actual time=2100.834..4568.122 rows=331910 loops=1)
                     ->  HashAggregate  (cost=182282.33..182284.33 rows=200 width=4) (actual time=2100.780..2253.831 rows=331910 loops=1)
                           Group Key: u0.id
                           ->  Unique  (cost=176426.41..178857.13 rows=274016 width=16) (actual time=1623.651..1913.647 rows=331910 loops=1)
                                 ->  Sort  (cost=176426.41..177641.77 rows=486144 width=16) (actual time=1623.649..1813.137 rows=486144 loops=1)
                                       Sort Key: u0.beneficiary_id, u0."timestamp"
                                       Sort Method: external merge  Disk: 12336kB
                                       ->  Hash Join  (cost=23869.97..122198.61 rows=486144 width=16) (actual time=170.401..1122.676 rows=486144 loops=1)
                                             Hash Cond: (u0.beneficiary_id = u1.id)
                                             ->  Seq Scan on beneficiaries_beneficiarydata u0  (cost=0.00..82218.44 rows=486144 width=20) (actual time=0.004..335.481 rows=486144 loops=1)
                                             ->  Hash  (cost=18424.10..18424.10 rows=331910 width=4) (actual time=170.289..170.289 rows=331910 loops=1)
                                                   Buckets: 16384  Batches: 4  Memory Usage: 2930kB
                                                   ->  Seq Scan on beneficiaries_beneficiary u1  (cost=0.00..18424.10 rows=331910 width=4) (actual time=0.007..97.347 rows=331910 loops=1)
                     ->  Index Scan using beneficiaries_beneficiarydata_pkey on beneficiaries_beneficiarydata  (cost=0.42..1.59 rows=1 width=1106) (actual time=0.006..0.006 rows=1 loops=331910)
                           Index Cond: (id = u0.id)
               ->  Hash  (cost=18424.10..18424.10 rows=331910 width=8) (actual time=198.324..198.324 rows=331910 loops=1)
                     Buckets: 16384  Batches: 4  Memory Usage: 3256kB
                     ->  Seq Scan on beneficiaries_beneficiary  (cost=0.00..18424.10 rows=331910 width=8) (actual time=0.009..120.202 rows=331910 loops=1)
 Planning time: 0.798 ms
 Execution time: 22980.278 ms



[test this one asap----(ben_id+timestamp DESC)]
 GroupAggregate  (cost=420206.54..442083.02 rows=243072 width=1106) (actual time=15428.510..21441.544 rows=7884 loops=1)
   Group Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
   ->  Sort  (cost=420206.54..420814.22 rows=243072 width=1106) (actual time=15425.535..17286.696 rows=331910 loops=1)
         Sort Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
         Sort Method: external merge  Disk: 341392kB
         ->  Hash Join  (cost=206152.72..280484.51 rows=243072 width=1106) (actual time=2394.135..9362.566 rows=331910 loops=1)
               Hash Cond: (beneficiaries_beneficiarydata.beneficiary_id = beneficiaries_beneficiary.id)
               ->  Nested Loop  (cost=182282.75..182604.57 rows=243072 width=1102) (actual time=2199.978..4126.746 rows=331910 loops=1)
                     ->  HashAggregate  (cost=182282.33..182284.33 rows=200 width=4) (actual time=2199.952..2350.003 rows=331910 loops=1)
                           Group Key: u0.id
                           ->  Unique  (cost=176426.41..178857.13 rows=274016 width=16) (actual time=1709.821..1991.196 rows=331910 loops=1)
                                 ->  Sort  (cost=176426.41..177641.77 rows=486144 width=16) (actual time=1709.819..1888.078 rows=486144 loops=1)
                                       Sort Key: u0.beneficiary_id, u0."timestamp"
                                       Sort Method: external merge  Disk: 12336kB
                                       ->  Hash Join  (cost=23869.97..122198.61 rows=486144 width=16) (actual time=183.237..1122.107 rows=486144 loops=1)
                                             Hash Cond: (u0.beneficiary_id = u1.id)
                                             ->  Seq Scan on beneficiaries_beneficiarydata u0  (cost=0.00..82218.44 rows=486144 width=20) (actual time=0.004..300.581 rows=486144 loops=1)
                                             ->  Hash  (cost=18424.10..18424.10 rows=331910 width=4) (actual time=183.023..183.023 rows=331910 loops=1)
                                                   Buckets: 32768  Batches: 2  Memory Usage: 5854kB
                                                   ->  Seq Scan on beneficiaries_beneficiary u1  (cost=0.00..18424.10 rows=331910 width=4) (actual time=0.004..90.406 rows=331910 loops=1)
                     ->  Index Scan using beneficiaries_beneficiarydata_pkey on beneficiaries_beneficiarydata  (cost=0.42..1.59 rows=1 width=1106) (actual time=0.004..0.005 rows=1 loops=331910)
                           Index Cond: (id = u0.id)
               ->  Hash  (cost=18424.10..18424.10 rows=331910 width=8) (actual time=194.048..194.048 rows=331910 loops=1)
                     Buckets: 32768  Batches: 2  Memory Usage: 6505kB
                     ->  Seq Scan on beneficiaries_beneficiary  (cost=0.00..18424.10 rows=331910 width=8) (actual time=0.006..112.453 rows=331910 loops=1)
 Planning time: 0.753 ms
 Execution time: 21512.092 ms

[(ben_id+timestamp DESC), ((data->>'scheme')+(data->>'scheme_code'))]
  GroupAggregate  (cost=420206.54..442083.02 rows=243072 width=1106) (actual time=13482.382..19186.846 rows=7884 loops=1)
   Group Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
   ->  Sort  (cost=420206.54..420814.22 rows=243072 width=1106) (actual time=13480.587..15212.778 rows=331910 loops=1)
         Sort Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
         Sort Method: external merge  Disk: 341392kB
         ->  Hash Join  (cost=206152.72..280484.51 rows=243072 width=1106) (actual time=2197.991..8359.352 rows=331910 loops=1)
               Hash Cond: (beneficiaries_beneficiarydata.beneficiary_id = beneficiaries_beneficiary.id)
               ->  Nested Loop  (cost=182282.75..182604.57 rows=243072 width=1102) (actual time=2013.085..3841.490 rows=331910 loops=1)
                     ->  HashAggregate  (cost=182282.33..182284.33 rows=200 width=4) (actual time=2013.059..2162.794 rows=331910 loops=1)
                           Group Key: u0.id
                           ->  Unique  (cost=176426.41..178857.13 rows=274016 width=16) (actual time=1552.880..1825.255 rows=331910 loops=1)
                                 ->  Sort  (cost=176426.41..177641.77 rows=486144 width=16) (actual time=1552.879..1723.619 rows=486144 loops=1)
                                       Sort Key: u0.beneficiary_id, u0."timestamp"
                                       Sort Method: external merge  Disk: 12336kB
                                       ->  Hash Join  (cost=23869.97..122198.61 rows=486144 width=16) (actual time=146.703..1015.748 rows=486144 loops=1)
                                             Hash Cond: (u0.beneficiary_id = u1.id)
                                             ->  Seq Scan on beneficiaries_beneficiarydata u0  (cost=0.00..82218.44 rows=486144 width=20) (actual time=0.005..283.596 rows=486144 loops=1)
                                             ->  Hash  (cost=18424.10..18424.10 rows=331910 width=4) (actual time=146.493..146.493 rows=331910 loops=1)
                                                   Buckets: 32768  Batches: 2  Memory Usage: 5854kB
                                                   ->  Seq Scan on beneficiaries_beneficiary u1  (cost=0.00..18424.10 rows=331910 width=4) (actual time=0.005..74.694 rows=331910 loops=1)
                     ->  Index Scan using beneficiaries_beneficiarydata_pkey on beneficiaries_beneficiarydata  (cost=0.42..1.59 rows=1 width=1106) (actual time=0.004..0.004 rows=1 loops=331910)
                           Index Cond: (id = u0.id)
               ->  Hash  (cost=18424.10..18424.10 rows=331910 width=8) (actual time=184.686..184.686 rows=331910 loops=1)
                     Buckets: 32768  Batches: 2  Memory Usage: 6505kB
                     ->  Seq Scan on beneficiaries_beneficiary  (cost=0.00..18424.10 rows=331910 width=8) (actual time=0.006..107.488 rows=331910 loops=1)
 Planning time: 0.703 ms
 Execution time: 19258.100 ms

  GroupAggregate  (cost=419684.72..441580.64 rows=243288 width=1103) (actual time=170198.544..183687.052 rows=7884 loops=1)
   Group Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
   ->  Sort  (cost=419684.72..420292.94 rows=243288 width=1103) (actual time=170196.652..179550.404 rows=331910 loops=1)
         Sort Key: beneficiaries_beneficiary.payer_slade_code, ((beneficiaries_beneficiarydata.data ->> 'scheme_code'::text)), ((beneficiaries_beneficiarydata.data ->> 'scheme'::text))
         Sort Method: external merge  Disk: 341392kB
         ->  Hash Join  (cost=206276.32..280669.80 rows=243288 width=1103) (actual time=9029.386..154748.112 rows=331910 loops=1)
               Hash Cond: (beneficiaries_beneficiarydata.beneficiary_id = beneficiaries_beneficiary.id)
               ->  Nested Loop  (cost=182406.35..182724.74 rows=243288 width=1099) (actual time=7697.114..120245.725 rows=331910 loops=1)
                     ->  HashAggregate  (cost=182405.93..182407.93 rows=200 width=4) (actual time=7661.022..7854.905 rows=331910 loops=1)
                           Group Key: u0.id
                           ->  Unique  (cost=176495.88..178928.76 rows=278173 width=16) (actual time=7175.907..7461.219 rows=331910 loops=1)
                                 ->  Sort  (cost=176495.88..177712.32 rows=486577 width=16) (actual time=7175.906..7355.604 rows=486144 loops=1)
                                       Sort Key: u0.beneficiary_id, u0."timestamp"
                                       Sort Method: external merge  Disk: 12336kB
                                       ->  Hash Join  (cost=23869.97..122217.06 rows=486577 width=16) (actual time=167.397..6592.567 rows=486144 loops=1)
                                             Hash Cond: (u0.beneficiary_id = u1.id)
                                             ->  Seq Scan on beneficiaries_beneficiarydata u0  (cost=0.00..82222.77 rows=486577 width=20) (actual time=2.816..5786.523 rows=486144 loops=1)
                                             ->  Hash  (cost=18424.10..18424.10 rows=331910 width=4) (actual time=164.305..164.305 rows=331910 loops=1)
                                                   Buckets: 32768  Batches: 2  Memory Usage: 5854kB
                                                   ->  Seq Scan on beneficiaries_beneficiary u1  (cost=0.00..18424.10 rows=331910 width=4) (actual time=0.006..79.682 rows=331910 loops=1)
                     ->  Index Scan using beneficiaries_beneficiarydata_pkey on beneficiaries_beneficiarydata  (cost=0.42..1.57 rows=1 width=1103) (actual time=0.337..0.337 rows=1 loops=331910)
                           Index Cond: (id = u0.id)
               ->  Hash  (cost=18424.10..18424.10 rows=331910 width=8) (actual time=1322.779..1322.779 rows=331910 loops=1)
                     Buckets: 32768  Batches: 2  Memory Usage: 6505kB
                     ->  Seq Scan on beneficiaries_beneficiary  (cost=0.00..18424.10 rows=331910 width=8) (actual time=5.600..1227.112 rows=331910 loops=1)
 Planning time: 310.200 ms
 Execution time: 183752.899 ms